function [aeroForces] = paramSpace_2_3_2_2_1_3_3(sailStates,airStates)

	CL = (4.574331)*sailStates.alpha + (-0.058618)*sailStates.beta + (-2.950134)*sailStates.p + (36.985836)*sailStates.q + (0.819121)*sailStates.r + (0.010983)*sailStates.de;
	CD = -0.519530;
	CY = (0.002924)*sailStates.alpha + (-0.025238)*sailStates.beta + (0.501771)*sailStates.p + (-0.668511)*sailStates.q + (0.032911)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.617093)*sailStates.alpha + (-0.241059)*sailStates.beta + (-1.516695)*sailStates.p + (12.301616)*sailStates.q + (0.825461)*sailStates.r + (0.000852)*sailStates.de;
	Cm = (-15.110772)*sailStates.alpha + (0.224473)*sailStates.beta + (10.410042)*sailStates.p + (-148.601761)*sailStates.q + (-2.757005)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (0.022684)*sailStates.alpha + (-0.013572)*sailStates.beta + (-1.200237)*sailStates.p + (6.314269)*sailStates.q + (-0.018099)*sailStates.r + (0.000307)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end