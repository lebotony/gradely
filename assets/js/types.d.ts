import { Colors } from "./components/colors";

declare global {
  type Colors = keyof typeof Colors;

  type VoidCallBack = () => void;

  type Role = "student" | "parent" | "teacher" | "admin";

  type UserObject = {
    id: string;
    name: string;
    surname: string;
    username?: string;
    avatar: string;
    email?: string;
    role: Role;
    token: string;
  };

  type User = UserObject | undefined;
}
