import React from "react";
import google from "../../images/google_logo.jpg";
import * as icon from "@phosphor-icons/react";
import * as styled from "./styles";

type IconProps = {
  name: string;
  size?: number;
  color?: string;
  weight?: "thin" | "light" | "regular" | "bold" | "fill" | "duotone";
};

export const Icon = (props: IconProps) => {
  const { name, size = 18, color = "black", weight = "regular" } = props;

  const iconsObj: { [key: string]: string } = {
    google,
  };

  const phosphorIcons = {
    graduationCap: icon.GraduationCapIcon,
    shield: icon.ShieldIcon,
    users: icon.UsersIcon,
    books: icon.BooksIcon,
    wavingHand: icon.HandWavingIcon,
    arrowLeft: icon.ArrowLeftIcon,
    smileyEmoji: icon.SmileyIcon,
    eye: icon.EyeIcon,
    eyeSlash: icon.EyeSlashIcon,
  };

  if (phosphorIcons[name]) {
    const IconComponent = phosphorIcons[name];
    return <IconComponent size={`${size}px`} color={color} weight={weight} />;
  }

  return (
    <styled.Wrapper>
      <styled.IconImage src={iconsObj[name]} size={size} color={color} />
    </styled.Wrapper>
  );
};
