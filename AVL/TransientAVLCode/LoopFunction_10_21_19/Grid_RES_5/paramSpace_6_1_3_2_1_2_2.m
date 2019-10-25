function [aeroForces] = paramSpace_6_1_3_2_1_2_2(sailStates,airStates)

	CL = (4.194958)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.771088)*sailStates.p + (36.024075)*sailStates.q + (0.262429)*sailStates.r + (0.011039)*sailStates.de;
	CD = -0.121390;
	CY = (-0.022151)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.237315)*sailStates.p + (-0.351850)*sailStates.q + (0.016582)*sailStates.r + (-0.000076)*sailStates.de;

	Cl = (1.398706)*sailStates.alpha + (-0.104440)*sailStates.beta + (-1.381228)*sailStates.p + (11.231711)*sailStates.q + (0.333157)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.985259)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.647619)*sailStates.p + (-143.366257)*sailStates.q + (-0.895476)*sailStates.r + (-0.070788)*sailStates.de;
	Cn = (0.124464)*sailStates.alpha + (-0.007303)*sailStates.beta + (-0.601116)*sailStates.p + (3.248966)*sailStates.q + (-0.012006)*sailStates.r + (0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end