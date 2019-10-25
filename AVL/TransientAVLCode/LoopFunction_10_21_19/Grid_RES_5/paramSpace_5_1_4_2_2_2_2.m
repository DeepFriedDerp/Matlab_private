function [aeroForces] = paramSpace_5_1_4_2_2_2_2(sailStates,airStates)

	CL = (4.097915)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.736273)*sailStates.p + (35.772068)*sailStates.q + (-0.131705)*sailStates.r + (0.010951)*sailStates.de;
	CD = -0.055320;
	CY = (0.067791)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.075147)*sailStates.p + (0.493724)*sailStates.q + (0.007951)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.321227)*sailStates.alpha + (-0.057465)*sailStates.beta + (-1.363218)*sailStates.p + (11.182038)*sailStates.q + (0.050210)*sailStates.r + (0.000609)*sailStates.de;
	Cm = (-14.916335)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.478703)*sailStates.p + (-142.416916)*sailStates.q + (0.411928)*sailStates.r + (-0.070303)*sailStates.de;
	Cn = (0.057361)*sailStates.alpha + (-0.006040)*sailStates.beta + (-0.293182)*sailStates.p + (1.285460)*sailStates.q + (-0.010867)*sailStates.r + (-0.000136)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end