import React from "react";
import * as styled from "../styles";
import { Icon } from "../../../components/icons";
import { Colors } from "../../../components/colors";

type MiniNavBarProps = {
  setCurrentlyActive: (value: Role) => void;
  currentlyActive: Role;
};

export const MiniNavBar = (props: MiniNavBarProps) => {
  const { currentlyActive, setCurrentlyActive } = props;

  const formDefinition = [
    {
      name: "student",
      icon: "graduationCap",
    },
    {
      name: "parent",
      icon: "users",
    },
    {
      name: "teacher",
      icon: "books",
      size: 20,
    },
    {
      name: "admin",
      icon: "shield",
    },
  ];

  const handleSetCurrentlyActive = (item) => {
    if (currentlyActive !== item) {
      setCurrentlyActive(item);
    }
  };

  return (
    <styled.UserNavBar>
      {formDefinition.map((item, id) => {
        const active = currentlyActive === item.name;
        return (
          <styled.NavBarButton
            onClick={() => handleSetCurrentlyActive(item.name)}
            key={id}
            active={active}
          >
            <Icon
              name={item.icon}
              color={active ? Colors.white : Colors.black}
              size={item.size && item.size}
            />
          </styled.NavBarButton>
        );
      })}
    </styled.UserNavBar>
  );
};
