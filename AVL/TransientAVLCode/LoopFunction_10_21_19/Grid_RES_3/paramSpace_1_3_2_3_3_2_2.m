function [aeroForces] = paramSpace_1_3_2_3_3_2_2(sailStates,airStates)

	CL = (3.930909)*sailStates.alpha + (0.177999)*sailStates.beta + (-2.472824)*sailStates.p + (35.076138)*sailStates.q + (-1.001094)*sailStates.r + (0.010603)*sailStates.de;
	CD = 0.041810;
	CY = (0.062713)*sailStates.alpha + (-0.023592)*sailStates.beta + (-0.275418)*sailStates.p + (0.491627)*sailStates.q + (-0.048564)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.188365)*sailStates.alpha + (0.173570)*sailStates.beta + (-1.116348)*sailStates.p + (9.313598)*sailStates.q + (-0.696617)*sailStates.r + (0.000188)*sailStates.de;
	Cm = (-13.784889)*sailStates.alpha + (-0.637440)*sailStates.beta + (8.110284)*sailStates.p + (-133.990982)*sailStates.q + (3.356395)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (-0.004581)*sailStates.alpha + (0.020923)*sailStates.beta + (0.443857)*sailStates.p + (-1.813591)*sailStates.q + (-0.009860)*sailStates.r + (-0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end