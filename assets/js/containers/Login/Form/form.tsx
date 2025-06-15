import React, { ChangeEvent, useState } from "react";
import { FormattedMessage, useIntl } from "react-intl";

import * as styled from "../Form/styles/index";
import { login, signUp } from "../actions";
import i18n from "../utils/i18n";

import { Icon } from "../../../components/icons";

type FormProps = {
  notSignedIn: boolean;
  currentlyActive: Role;
  onCurrentUser: (user: UserObject) => void;
};

export const Form = (props: FormProps) => {
  const { notSignedIn, currentlyActive, onCurrentUser } = props;
  const intl = useIntl();

  const [hidePassword, setHidePassword] = useState(true);
  const [formObject, setFormObject] = useState({
    username: "",
    password: "",
    email: "",
  });

  const onChange = (e: ChangeEvent<HTMLInputElement>) =>
    setFormObject({
      ...formObject,
      [e.target.name]: e.target.value,
    });

  const signText = intl.formatMessage(notSignedIn ? i18n.signUp : i18n.signIn);
  const googleSignText = intl.formatMessage(
    notSignedIn ? i18n.signUpGoogle : i18n.signInGoogle
  );

  const handleSubmitCredentials = () => {
    const updatedFormObject = {
      ...formObject,
      role: currentlyActive,
    };

    if (notSignedIn) {
      signUp(updatedFormObject)
        .then((response) => onCurrentUser(response))
        .catch((err) => err);
    } else {
      login(updatedFormObject)
        .then((response) => onCurrentUser(response))
        .catch((err) => err);
    }
  };

  const shownPassword = hidePassword
    ? "*".repeat(formObject.password.length)
    : formObject.password;

  return (
    <styled.Wrapper>
      {notSignedIn && (
        <styled.InputItem>
          <styled.InputLabel>
            <FormattedMessage {...i18n.emailLabel} />
          </styled.InputLabel>
          <styled.Input
            name="email"
            value={formObject.email}
            onChange={onChange}
            placeholder={intl.formatMessage(i18n.emailPlaceholder)}
          />
        </styled.InputItem>
      )}
      <styled.InputItem>
        <styled.InputLabel>
          <FormattedMessage {...i18n.usernameLabel} />
        </styled.InputLabel>
        <styled.Input
          name="username"
          value={formObject.username}
          onChange={onChange}
          placeholder={intl.formatMessage(i18n.usernamePlaceholder)}
        />
      </styled.InputItem>
      <styled.InputItem>
        <styled.InputLabel>
          <FormattedMessage {...i18n.passwordLabel} />
        </styled.InputLabel>
        <styled.InputWrapper>
          <styled.Input
            name="password"
            value={formObject.password}
            onChange={onChange}
            placeholder={intl.formatMessage(i18n.passwordPlaceholder)}
          />
          <styled.EyeIcon onClick={() => setHidePassword(!hidePassword)}>
            <Icon name={hidePassword ? "eyeSlash" : "eye"} />
          </styled.EyeIcon>
        </styled.InputWrapper>
      </styled.InputItem>
      {!notSignedIn && (
        <styled.ForgotWrapper>
          <styled.ForgotText>
            <FormattedMessage {...i18n.rememberMe} />
          </styled.ForgotText>
          <styled.ForgotText item="forgot">
            <FormattedMessage {...i18n.forgot} />
          </styled.ForgotText>
        </styled.ForgotWrapper>
      )}
      <styled.ButtonWrapper>
        <styled.SignInButton onClick={handleSubmitCredentials}>
          {signText}
        </styled.SignInButton>
        <styled.SignInGoogle>
          <Icon name="google" size={40} />
          {googleSignText}
        </styled.SignInGoogle>
      </styled.ButtonWrapper>
    </styled.Wrapper>
  );
};
