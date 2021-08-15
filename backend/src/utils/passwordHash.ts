import bcrypt from "bcrypt";

export const hashPassword = (clearPwd: string) => bcrypt.hash(clearPwd, 10);
