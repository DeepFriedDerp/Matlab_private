function [aeroForces] = paramSpace_2_3_2_2_3_2_3(sailStates,airStates)

	CL = (4.037194)*sailStates.alpha + (0.038654)*sailStates.beta + (-2.960977)*sailStates.p + (38.278469)*sailStates.q + (-0.591975)*sailStates.r + (0.011225)*sailStates.de;
	CD = 0.014140;
	CY = (0.072387)*sailStates.alpha + (-0.024635)*sailStates.beta + (-0.223862)*sailStates.p + (0.870359)*sailStates.q + (-0.014703)*sailStates.r + (0.000189)*sailStates.de;

	Cl = (1.410903)*sailStates.alpha + (0.090047)*sailStates.beta + (-1.515385)*sailStates.p + (12.647346)*sailStates.q + (-0.447069)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.464021)*sailStates.alpha + (-0.147544)*sailStates.beta + (10.009195)*sailStates.p + (-147.878265)*sailStates.q + (2.005296)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.036468)*sailStates.alpha + (0.004759)*sailStates.beta + (0.381376)*sailStates.p + (-2.005807)*sailStates.q + (0.002219)*sailStates.r + (-0.000278)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end