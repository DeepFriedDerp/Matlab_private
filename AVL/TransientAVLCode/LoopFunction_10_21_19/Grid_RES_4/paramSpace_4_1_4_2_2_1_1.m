function [aeroForces] = paramSpace_4_1_4_2_2_1_1(sailStates,airStates)

	CL = (3.968935)*sailStates.alpha + (-0.024900)*sailStates.beta + (-1.995797)*sailStates.p + (28.180468)*sailStates.q + (-0.188286)*sailStates.r + (0.009460)*sailStates.de;
	CD = -0.285170;
	CY = (0.082201)*sailStates.alpha + (-0.023734)*sailStates.beta + (-0.275148)*sailStates.p + (0.301044)*sailStates.q + (0.054763)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.097257)*sailStates.alpha + (0.108674)*sailStates.beta + (-0.858504)*sailStates.p + (6.414819)*sailStates.q + (-0.360057)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-14.514497)*sailStates.alpha + (0.048236)*sailStates.beta + (7.513559)*sailStates.p + (-122.964470)*sailStates.q + (0.524435)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.502955)*sailStates.alpha + (-0.032487)*sailStates.beta + (0.773992)*sailStates.p + (-4.285970)*sailStates.q + (-0.048636)*sailStates.r + (-0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end