const sendToken = (user, statusCode, res) => {
  const token = user.getJWTToken();

  const days = parseInt(process.env.JWT_EXPIRES_TIME, 10) || 1;
  const cookieOptions = {
    expires: new Date(Date.now() + days * 24 * 60 * 60 * 1000),
    httpOnly: true,
    secure: process.env.NODE_ENV === "PRODUCTION",
    sameSite: "Lax",
  };

  res.cookie("jwt", token, cookieOptions);

  user.password = undefined;

  res.status(statusCode).json({
    success: true,
    token,
    data: { user },
  });
};

export default sendToken;
