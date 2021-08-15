import bcrypt from "bcrypt";

export const hashPassword = (clearPwd: string) => bcrypt.hash(clearPwd, 10);

export const comparePassword = async (hash: string, clearPwd: string) =>
  await bcrypt.compare(clearPwd, hash);
