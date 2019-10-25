function [aeroForces] = paramSpace_4_4_4_2_2_1_1(sailStates,airStates)

	CL = (3.968936)*sailStates.alpha + (0.024900)*sailStates.beta + (-1.995797)*sailStates.p + (28.180468)*sailStates.q + (-0.188286)*sailStates.r + (0.009460)*sailStates.de;
	CD = -0.285170;
	CY = (0.082201)*sailStates.alpha + (-0.025838)*sailStates.beta + (-0.275148)*sailStates.p + (0.301044)*sailStates.q + (0.054763)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (0.931241)*sailStates.alpha + (0.144563)*sailStates.beta + (-0.764147)*sailStates.p + (5.226935)*sailStates.q + (-0.378953)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-14.514497)*sailStates.alpha + (-0.048236)*sailStates.beta + (7.513559)*sailStates.p + (-122.964470)*sailStates.q + (0.524435)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.504022)*sailStates.alpha + (-0.017885)*sailStates.beta + (0.755224)*sailStates.p + (-4.049685)*sailStates.q + (-0.044877)*sailStates.r + (-0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end