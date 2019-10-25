function [aeroForces] = paramSpace_4_4_3_2_3_1_2(sailStates,airStates)

	CL = (4.220628)*sailStates.alpha + (0.049989)*sailStates.beta + (-2.406046)*sailStates.p + (31.310823)*sailStates.q + (-0.233289)*sailStates.r + (0.009726)*sailStates.de;
	CD = -0.402380;
	CY = (0.085809)*sailStates.alpha + (-0.027271)*sailStates.beta + (-0.361680)*sailStates.p + (0.756269)*sailStates.q + (0.071970)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.281230)*sailStates.alpha + (0.167173)*sailStates.beta + (-1.096340)*sailStates.p + (8.248081)*sailStates.q + (-0.432954)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-15.082962)*sailStates.alpha + (-0.194944)*sailStates.beta + (9.032172)*sailStates.p + (-134.899979)*sailStates.q + (0.673950)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.439442)*sailStates.alpha + (-0.018922)*sailStates.beta + (0.993613)*sailStates.p + (-5.702810)*sailStates.q + (-0.068197)*sailStates.r + (-0.000300)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end