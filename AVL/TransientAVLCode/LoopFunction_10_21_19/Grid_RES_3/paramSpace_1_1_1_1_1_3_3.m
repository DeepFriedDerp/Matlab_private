function [aeroForces] = paramSpace_1_1_1_1_1_3_3(sailStates,airStates)

	CL = (6.206658)*sailStates.alpha + (0.293194)*sailStates.beta + (-3.236641)*sailStates.p + (34.999256)*sailStates.q + (1.481461)*sailStates.r + (0.009544)*sailStates.de;
	CD = -2.469150;
	CY = (0.263114)*sailStates.alpha + (-0.021838)*sailStates.beta + (0.992227)*sailStates.p + (-1.081942)*sailStates.q + (0.175059)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (2.541489)*sailStates.alpha + (-0.374270)*sailStates.beta + (-1.892856)*sailStates.p + (15.142537)*sailStates.q + (1.548202)*sailStates.r + (0.001699)*sailStates.de;
	Cm = (-15.818054)*sailStates.alpha + (-1.088706)*sailStates.beta + (12.865803)*sailStates.p + (-160.704926)*sailStates.q + (-4.791740)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (-0.760764)*sailStates.alpha + (-0.097473)*sailStates.beta + (-2.544223)*sailStates.p + (13.681365)*sailStates.q + (-0.117063)*sailStates.r + (0.000569)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end