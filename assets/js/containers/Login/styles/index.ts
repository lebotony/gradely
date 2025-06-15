import styled, { css } from "styled-components";
import { Colors } from "../../../components/colors";
import { IS_MOBILE as isMobile } from "../../../helpers";

export const Wrapper = styled.div`
  width: 100%;
  height: 100%;
  color: black;
  display: ${isMobile ? "column" : "flex"};
`;

export const GoBack = styled.div`
  width: ${isMobile ? "40px" : "60px"};
  height: ${isMobile ? "40px" : "60px"};
  box-shadow: 0 5px 5px rgba(0, 0, 0, 0.2);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: ${Colors.chalk};
  position: absolute;
  top: ${isMobile ? "15px" : "30px"};
  left: ${isMobile ? "15px" : "30px"};

  &:hover {
    transform: scale(1.1);
    transition: transform 0.2s ease-in-out;
    cursor: pointer;
  }
`;

export const RightContainer = styled.div`
  ${isMobile && "display: none;"}
  width: 50%;
  height: 100%;
  padding: 20px;
`;

export const Chalk = styled.div`
  width: 100%;
  height: 100%;
  background-color: ${Colors.white};
  border-radius: 15px;
  padding: 20px;
  box-shadow: 0 5px 5px rgba(0, 0, 0, 0.3);
`;

export const BackgroundImage = styled.img`
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 15px;
  box-shadow: 0 5px 5px rgba(0, 0, 0, 0.3);
`;

const isMobileMixin = css`
  width: 100%;
  padding: 25px;
`;

export const LeftContainer = styled.div<{ notSignedIn: boolean }>`
  width: 50%;
  ${({ notSignedIn }) => notSignedIn && "padding-left: 70px;"}
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;

  ${isMobile &&
  css`
    width: 100%;
    padding-left: 0;
  `}
`;

export const LeftContent = styled.div`
  width: 350px;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  ${isMobile && isMobileMixin}
`;

export const HeaderWrapper = styled.div`
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
`;

export const Title = styled.div`
  width: 100%;
  font-weight: 600;
  font-size: 33px;
  color: ${Colors.fontBlack};
  display: flex;
  align-items: center;
  gap: 10px;

  ${isMobile &&
  css`
    font-weight: 500;
    font-size: 25px;
    justify-content: center;
  `}
`;

export const Desciption = styled.div`
  width: 100%;
  font-size: 15px;
  color: ${Colors.gray};
  display: flex;
  align-items: center;
  gap: 5px;

  ${isMobile &&
  css`
    font-weight: 500;
    font-size: 13px;
    justify-content: center;
  `}
`;

export const UserNavBar = styled.div`
  height: 200px;
  width: 50px;
  border-radius: 5px;
  box-shadow: 0 5px 5px rgba(0, 0, 0, 0.3), 0 -1px 1px rgba(0, 0, 0, 0.1);
  background-color: ${Colors.white};
  position: absolute;
  left: 30px;
  display: flex;
  flex-direction: column;
  align-items: center;

  ${isMobile &&
  css`
    box-shadow: 0 3px 3px rgba(0, 0, 0, 0.2), 0 -1px 1px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
    flex-direction: row;
    position: static;
    height: 40px;
    width: 300px;
  `}
`;

export const NavBarButton = styled.div<{ active?: boolean }>`
  width: 100%;
  height: ${isMobile ? "100%" : "25%"};
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 5px;
  padding: 10px;
  ${({ active }) => active && `background-color: ${Colors.fontBlack}`};
  cursor: pointer;
`;

export const AccountText = styled.div`
  font-size: 13px;
  color: ${Colors.gray};
  font-weight: 700;
  display: flex;
  align-items: center;
  justify-content: center;
`;

export const AccountHighlitedText = styled(AccountText)`
  color: ${Colors.neonRed};
  font-weight: 700;
  cursor: pointer;
`;

export const Footer = styled.div`
  width: 100%;
  margin-top: 17px;
  display: flex;
  align-items: center;
  justify-content: center;
`;
