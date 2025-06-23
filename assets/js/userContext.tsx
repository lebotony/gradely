import React, {
  ReactNode,
  createContext,
  useCallback,
  useContext,
  useMemo,
  useState,
} from "react";

type UserContextType = {
  user?: UserObject;
  updateUser: (user: UserObject) => void;
  role?: Role;
};

const UserContext = createContext<UserContextType | undefined>(undefined);

type UserProviderProps = {
  children: ReactNode;
};

export const UserProvider: React.FC<UserProviderProps> = (props) => {
  const { children } = props;
  const [user, setUser] = useState<UserObject>();

  const updateUser = useCallback(
    (newObject: UserObject) =>
      setUser((prevState) => ({ ...prevState, ...newObject })),
    []
  );

  const value = useMemo(
    () => ({
      user,
      updateUser,
      role: user?.role,
    }),
    [user, updateUser]
  );

  return <UserContext.Provider value={value}>{children}</UserContext.Provider>;
};

export const useUser = () => {
  const context = useContext(UserContext);
  if (!context) throw new Error("useUser must be used within a UserProvider");
  return context;
};
