function [aeroForces] = paramSpace_3_3_1_1_1_1_3(sailStates,airStates)

	CL = (5.185677)*sailStates.alpha + (0.135000)*sailStates.beta + (-3.376822)*sailStates.p + (39.545887)*sailStates.q + (-1.345148)*sailStates.r + (0.011001)*sailStates.de;
	CD = -1.727940;
	CY = (-0.482161)*sailStates.alpha + (-0.024496)*sailStates.beta + (-0.687480)*sailStates.p + (-1.915493)*sailStates.q + (0.045262)*sailStates.r + (-0.000419)*sailStates.de;

	Cl = (1.289292)*sailStates.alpha + (0.449677)*sailStates.beta + (-1.885697)*sailStates.p + (15.617453)*sailStates.q + (-1.432325)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-13.446510)*sailStates.alpha + (-0.576847)*sailStates.beta + (12.015100)*sailStates.p + (-160.694275)*sailStates.q + (4.624564)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (0.965221)*sailStates.alpha + (-0.026892)*sailStates.beta + (1.699951)*sailStates.p + (-6.621574)*sailStates.q + (-0.010128)*sailStates.r + (0.000409)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end