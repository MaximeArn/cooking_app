import bcrypt from "bcrypt";

export const hashPassword = (clearPwd: string) => bcrypt.hash(clearPwd, 10);

export const comparePassword = (hash: string, clearPwd: string) =>
  bcrypt.compare(clearPwd, hash, (err, res) => {
    err ? console.log(err) : console.log(res);
  });
