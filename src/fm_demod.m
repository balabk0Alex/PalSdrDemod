function demod_signal = fm_demod(data, mod)

switch mod
    case "iq_mode"
        [I_s, Q_s] = onedimarray_to_IQ(data);
        [A_s, Phi_s] = IQ_to_A_Phi(I_s, Q_s );
        yrap = unwrap(Phi_s);
        z_fm =[diff(yrap) 0];
        demod_signal = z_fm;
end