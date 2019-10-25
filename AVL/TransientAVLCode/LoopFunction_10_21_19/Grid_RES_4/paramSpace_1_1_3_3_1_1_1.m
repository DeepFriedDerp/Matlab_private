function [aeroForces] = paramSpace_1_1_3_3_1_1_1(sailStates,airStates)

	CL = (4.008800)*sailStates.alpha + (-0.316105)*sailStates.beta + (-2.275288)*sailStates.p + (35.101292)*sailStates.q + (-1.409926)*sailStates.r + (0.010856)*sailStates.de;
	CD = -0.131180;
	CY = (-0.043831)*sailStates.alpha + (-0.022679)*sailStates.beta + (-0.407142)*sailStates.p + (-0.684401)*sailStates.q + (-0.081010)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.122454)*sailStates.alpha + (0.138465)*sailStates.beta + (-1.020600)*sailStates.p + (9.032010)*sailStates.q + (-1.097843)*sailStates.r + (0.000159)*sailStates.de;
	Cm = (-12.540347)*sailStates.alpha + (1.152359)*sailStates.beta + (7.039623)*sailStates.p + (-127.495163)*sailStates.q + (4.699508)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (-0.052728)*sailStates.alpha + (0.043318)*sailStates.beta + (0.787685)*sailStates.p + (-2.478598)*sailStates.q + (-0.021301)*sailStates.r + (0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end