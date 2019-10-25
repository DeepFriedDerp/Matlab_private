function [aeroForces] = paramSpace_2_2_2_2_2_1_2(sailStates,airStates)

	CL = (4.593447)*sailStates.alpha + (-0.105537)*sailStates.beta + (-2.592868)*sailStates.p + (36.184959)*sailStates.q + (-1.347053)*sailStates.r + (0.011269)*sailStates.de;
	CD = -0.479270;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.559944)*sailStates.p + (-0.000000)*sailStates.q + (-0.036701)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.429369)*sailStates.alpha + (0.250305)*sailStates.beta + (-1.232630)*sailStates.p + (10.307763)*sailStates.q + (-1.185933)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.193540)*sailStates.alpha + (0.415876)*sailStates.beta + (8.530774)*sailStates.p + (-137.194580)*sailStates.q + (4.576222)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.117553)*sailStates.alpha + (0.018739)*sailStates.beta + (1.182495)*sailStates.p + (-5.089459)*sailStates.q + (0.005026)*sailStates.r + (-0.000094)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end