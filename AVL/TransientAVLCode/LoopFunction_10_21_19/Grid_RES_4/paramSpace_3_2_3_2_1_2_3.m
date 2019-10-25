function [aeroForces] = paramSpace_3_2_3_2_1_2_3(sailStates,airStates)

	CL = (4.037194)*sailStates.alpha + (0.038654)*sailStates.beta + (-2.960977)*sailStates.p + (38.278465)*sailStates.q + (0.591975)*sailStates.r + (0.011225)*sailStates.de;
	CD = 0.014140;
	CY = (-0.072387)*sailStates.alpha + (-0.025317)*sailStates.beta + (0.223862)*sailStates.p + (-0.870359)*sailStates.q + (-0.014703)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.455512)*sailStates.alpha + (-0.063156)*sailStates.beta + (-1.548032)*sailStates.p + (13.051228)*sailStates.q + (0.449223)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.464019)*sailStates.alpha + (-0.147544)*sailStates.beta + (10.009195)*sailStates.p + (-147.878265)*sailStates.q + (-2.005296)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.046117)*sailStates.alpha + (0.005283)*sailStates.beta + (-0.379236)*sailStates.p + (1.979335)*sailStates.q + (0.002078)*sailStates.r + (0.000278)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end