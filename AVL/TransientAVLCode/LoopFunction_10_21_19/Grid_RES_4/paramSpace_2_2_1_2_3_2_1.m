function [aeroForces] = paramSpace_2_2_1_2_3_2_1(sailStates,airStates)

	CL = (4.023183)*sailStates.alpha + (-0.040869)*sailStates.beta + (-2.156406)*sailStates.p + (31.777559)*sailStates.q + (-0.493826)*sailStates.r + (0.010807)*sailStates.de;
	CD = 0.024670;
	CY = (0.118567)*sailStates.alpha + (-0.025285)*sailStates.beta + (-0.205979)*sailStates.p + (0.668512)*sailStates.q + (-0.013571)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.099146)*sailStates.alpha + (0.065805)*sailStates.beta + (-0.890822)*sailStates.p + (6.954262)*sailStates.q + (-0.386245)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.453485)*sailStates.alpha + (0.176269)*sailStates.beta + (7.321045)*sailStates.p + (-125.787453)*sailStates.q + (1.694275)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.206508)*sailStates.alpha + (0.005340)*sailStates.beta + (0.377179)*sailStates.p + (-1.937311)*sailStates.q + (0.003068)*sailStates.r + (-0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end