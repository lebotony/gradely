import React, { useCallback, useEffect, useState } from "react";

import { ToastContainer } from "react-toastify";

import * as styled from "./styles/styles";
import { Login } from "./containers/Login";
import { useUser } from "./userContext";
import { getUser } from "./containers/Login/actions";

export const App = () => {
  const [currentUser, setCurrentUser] = useState<UserObject | null>(null);
  const { updateUser } = useUser();

  const handleCurrentUser = useCallback((user: UserObject) => {
    updateUser(user);
    setCurrentUser(user);
  }, []);

  const token = sessionStorage.getItem("token") || null;

  useEffect(() => {
    if (token) {
      const fetchUser = () => {
        getUser(token)
          .then((res) => {
            updateUser(res);
            setCurrentUser(res);
          })
          .catch((err) => {
            return err;
          });
      };

      if (!currentUser) {
        fetchUser();
      }
    }
  }, [currentUser, token]);

  return (
    <styled.Container>
      <ToastContainer />
      <Login onCurrentUser={handleCurrentUser} />
    </styled.Container>
  );
};
