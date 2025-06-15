import styled from "styled-components";
import { Colors } from "../../../../components/colors";

export const Wrapper = styled.div`
  width: 100%;
  background-color: ${Colors.white};
  margin-top: 40px;
`;

export const InputItem = styled.div`
  width: 100%;
  margin-bottom: 25px;
`;

export const InputWrapper = styled.div`
  position: relative;
  width: 100%;
`;

export const Input = styled.input.attrs({
  spellCheck: "false",
})`
  width: 100%;
  border: 1px solid ${Colors.lightgray};
  border-radius: 8px;
  height: 43px;
  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
  padding: 10px;
  font-weight: 600;
  font-size: 14px;
  display: flex;
  align-items: center;

  &:focus {
    outline: none;
    border: 2px solid ${Colors.gray};
  }
`;

export const InputLabel = styled.div`
  width: 100%;
  font-weight: 700;
  margin-bottom: 8px;
  font-size: 15px;
  color: ${Colors.fontBlack};
`;

export const EyeIcon = styled.div`
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
  cursor: pointer;
`;

export const ForgotWrapper = styled.div`
  width: 100%;
  display: flex;
  justify-content: space-between;
  margin-bottom: 12px;
`;

export const ForgotText = styled.div<{ item?: string }>`
  width: 100%;
  display: flex;
  gap: 10px;
  font-weight: 700;
  font-size: 14px;
  color: ${Colors.fontBlack};
  justify-content: ${({ item }) =>
    item === "forgot" && "flex-end; cursor: pointer;"};
`;

export const ButtonWrapper = styled.div`
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 10px;
`;

export const SignInButton = styled.div`
  width: 100%;
  height: 43px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: ${Colors.neonRed};
  color: ${Colors.white};
  font-weight: 600;
  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
  cursor: pointer;
`;

export const SignInGoogle = styled(SignInButton)`
  font-weight: 800;
  font-size: 15px;
  align-items: center;
  border: 1px solid ${Colors.lightgray};
  background-color: ${Colors.white};
  color: ${Colors.fontBlack};
  cursor: pointer;
`;
