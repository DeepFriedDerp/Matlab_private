function [aeroForces] = paramSpace_1_1_1_2_1_3_2(sailStates,airStates)

	CL = (4.263312)*sailStates.alpha + (0.048409)*sailStates.beta + (-2.436002)*sailStates.p + (31.743971)*sailStates.q + (0.329061)*sailStates.r + (0.009871)*sailStates.de;
	CD = -0.400670;
	CY = (-0.087041)*sailStates.alpha + (-0.022730)*sailStates.beta + (0.375443)*sailStates.p + (-0.759371)*sailStates.q + (0.066273)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.451388)*sailStates.alpha + (-0.138415)*sailStates.beta + (-1.199270)*sailStates.p + (9.472524)*sailStates.q + (0.468433)*sailStates.r + (0.000490)*sailStates.de;
	Cm = (-15.075006)*sailStates.alpha + (-0.147245)*sailStates.beta + (9.075233)*sailStates.p + (-135.573257)*sailStates.q + (-1.001248)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.417438)*sailStates.alpha + (-0.036768)*sailStates.beta + (-1.027855)*sailStates.p + (5.997030)*sailStates.q + (-0.061635)*sailStates.r + (0.000314)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end