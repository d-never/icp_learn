export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'greet' : IDL.Func([IDL.Text], [IDL.Text], ['query']),
    'qsort' : IDL.Func([IDL.Vec(IDL.Int)], [IDL.Vec(IDL.Int)], []),
  });
};
export const init = ({ IDL }) => { return []; };
