function [aeroForces] = paramSpace_1_2_2_1_3_3_1(sailStates,airStates)

	CL = (4.789793)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.446922)*sailStates.p + (21.185135)*sailStates.q + (1.240508)*sailStates.r + (0.008974)*sailStates.de;
	CD = -1.620510;
	CY = (-0.131660)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.665305)*sailStates.p + (1.081942)*sailStates.q + (0.117311)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (0.413527)*sailStates.alpha + (-0.375811)*sailStates.beta + (-0.394232)*sailStates.p + (1.371673)*sailStates.q + (1.379644)*sailStates.r + (-0.000880)*sailStates.de;
	Cm = (-14.764920)*sailStates.alpha + (0.000000)*sailStates.beta + (6.318394)*sailStates.p + (-109.437057)*sailStates.q + (-4.087830)*sailStates.r + (-0.066001)*sailStates.de;
	Cn = (1.368265)*sailStates.alpha + (-0.066266)*sailStates.beta + (-1.588676)*sailStates.p + (6.326691)*sailStates.q + (-0.024601)*sailStates.r + (-0.000189)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end