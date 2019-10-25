function [aeroForces] = paramSpace_4_2_3_2_3_2_3(sailStates,airStates)

	CL = (3.697394)*sailStates.alpha + (0.070425)*sailStates.beta + (-2.889487)*sailStates.p + (38.484646)*sailStates.q + (0.953269)*sailStates.r + (0.010793)*sailStates.de;
	CD = 0.095580;
	CY = (0.084312)*sailStates.alpha + (-0.024476)*sailStates.beta + (0.156637)*sailStates.p + (0.455226)*sailStates.q + (-0.031141)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.274635)*sailStates.alpha + (-0.073898)*sailStates.beta + (-1.510576)*sailStates.p + (13.129785)*sailStates.q + (0.661121)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-13.287702)*sailStates.alpha + (-0.264356)*sailStates.beta + (9.676376)*sailStates.p + (-146.782669)*sailStates.q + (-3.233665)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.351635)*sailStates.alpha + (0.016705)*sailStates.beta + (-0.099344)*sailStates.p + (-0.994957)*sailStates.q + (-0.052030)*sailStates.r + (-0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end