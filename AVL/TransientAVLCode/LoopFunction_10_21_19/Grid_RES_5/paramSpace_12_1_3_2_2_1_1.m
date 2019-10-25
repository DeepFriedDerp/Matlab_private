function [aeroForces] = paramSpace_12_1_3_2_2_1_1(sailStates,airStates)

	CL = (4.052972)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.298626)*sailStates.p + (32.000206)*sailStates.q + (0.007043)*sailStates.r + (0.010476)*sailStates.de;
	CD = -0.076300;
	CY = (0.078181)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.168089)*sailStates.p + (0.520429)*sailStates.q + (0.023642)*sailStates.r + (0.000111)*sailStates.de;

	Cl = (1.163727)*sailStates.alpha + (0.063171)*sailStates.beta + (-1.012580)*sailStates.p + (7.848579)*sailStates.q + (-0.140719)*sailStates.r + (0.000082)*sailStates.de;
	Cm = (-14.825896)*sailStates.alpha + (0.000000)*sailStates.beta + (8.160213)*sailStates.p + (-130.856766)*sailStates.q + (-0.062610)*sailStates.r + (-0.068597)*sailStates.de;
	Cn = (-0.313425)*sailStates.alpha + (-0.008878)*sailStates.beta + (0.488432)*sailStates.p + (-3.019420)*sailStates.q + (-0.028915)*sailStates.r + (-0.000194)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end