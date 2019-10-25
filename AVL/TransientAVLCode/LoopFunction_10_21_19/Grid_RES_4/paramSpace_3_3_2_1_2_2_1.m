function [aeroForces] = paramSpace_3_3_2_1_2_2_1(sailStates,airStates)

	CL = (3.760188)*sailStates.alpha + (-0.014407)*sailStates.beta + (-1.682041)*sailStates.p + (27.793028)*sailStates.q + (0.213728)*sailStates.r + (0.010662)*sailStates.de;
	CD = 0.027090;
	CY = (0.015836)*sailStates.alpha + (-0.025048)*sailStates.beta + (0.032353)*sailStates.p + (0.221995)*sailStates.q + (-0.002128)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (0.569623)*sailStates.alpha + (-0.028689)*sailStates.beta + (-0.469053)*sailStates.p + (2.877868)*sailStates.q + (0.121214)*sailStates.r + (-0.000847)*sailStates.de;
	Cm = (-13.769896)*sailStates.alpha + (0.043853)*sailStates.beta + (5.804585)*sailStates.p + (-112.898659)*sailStates.q + (-0.720617)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (0.036462)*sailStates.alpha + (0.001710)*sailStates.beta + (-0.065734)*sailStates.p + (0.180408)*sailStates.q + (-0.001641)*sailStates.r + (-0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end