import React, { useState } from "react";
import { FormattedMessage, useIntl } from "react-intl";

import * as styled from "./styles";
import i18n from "./utils/i18n";
import backgroundPic from "../../images/student_10.png";
import { MiniNavBar } from "./MiniNavBar";
import { Form } from "./Form/form";
import { Icon } from "../../components/icons";
import { Colors } from "../../components/colors";
import { IS_MOBILE as isMobile } from "../../helpers";

type LoginProps = {
  onCurrentUser: (user: UserObject) => void;
};

export const Login = (props: LoginProps) => {
  const { onCurrentUser } = props;
  const intl = useIntl();

  const [notSignedIn, setNotSignedIn] = useState(false);
  const [currentlyActive, setCurrentlyActive] = useState<Role>("student");

  const title = intl.formatMessage(notSignedIn ? i18n.signUpTitle : i18n.title);
  const description = intl.formatMessage(
    notSignedIn ? i18n.signUpDescription : i18n.description
  );

  return (
    <styled.Wrapper>
      <styled.LeftContainer notSignedIn={notSignedIn}>
        {notSignedIn && (
          <styled.GoBack onClick={() => setNotSignedIn(false)}>
            <Icon
              name="arrowLeft"
              size={isMobile ? 20 : 27}
              weight="bold"
              color={Colors.fontBlack}
            />
          </styled.GoBack>
        )}
        <styled.LeftContent>
          <styled.HeaderWrapper>
            <styled.Title>
              {title}
              <Icon name="wavingHand" size={30} weight="duotone" />
            </styled.Title>
            <styled.Desciption>
              {description}
              <Icon name="smileyEmoji" size={18} weight="bold" />
            </styled.Desciption>
          </styled.HeaderWrapper>
          {notSignedIn && (
            <MiniNavBar
              currentlyActive={currentlyActive}
              setCurrentlyActive={(value: Role) => setCurrentlyActive(value)}
            />
          )}
          <Form
            onCurrentUser={onCurrentUser}
            notSignedIn={notSignedIn}
            currentlyActive={currentlyActive}
          />
          {!notSignedIn && (
            <styled.Footer>
              <styled.AccountText>
                <FormattedMessage {...i18n.account} />
              </styled.AccountText>
              &nbsp;
              <styled.AccountHighlitedText onClick={() => setNotSignedIn(true)}>
                <FormattedMessage {...i18n.signUp} />
              </styled.AccountHighlitedText>
            </styled.Footer>
          )}
        </styled.LeftContent>
      </styled.LeftContainer>
      <styled.RightContainer>
        <styled.BackgroundImage src={backgroundPic} />
      </styled.RightContainer>
    </styled.Wrapper>
  );
};
