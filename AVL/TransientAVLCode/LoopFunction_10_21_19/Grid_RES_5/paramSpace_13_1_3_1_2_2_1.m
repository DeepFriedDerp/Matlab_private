function [aeroForces] = paramSpace_13_1_3_1_2_2_1(sailStates,airStates)

	CL = (4.444502)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.119543)*sailStates.p + (35.017097)*sailStates.q + (1.754887)*sailStates.r + (0.011288)*sailStates.de;
	CD = -0.602150;
	CY = (0.045813)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.595118)*sailStates.p + (1.304044)*sailStates.q + (-0.104889)*sailStates.r + (0.000275)*sailStates.de;

	Cl = (0.901247)*sailStates.alpha + (-0.349573)*sailStates.beta + (-0.811456)*sailStates.p + (7.037516)*sailStates.q + (1.471588)*sailStates.r + (-0.000257)*sailStates.de;
	Cm = (-11.623881)*sailStates.alpha + (0.000000)*sailStates.beta + (6.235693)*sailStates.p + (-122.917580)*sailStates.q + (-5.879111)*sailStates.r + (-0.067165)*sailStates.de;
	Cn = (0.492712)*sailStates.alpha + (0.061639)*sailStates.beta + (-1.276690)*sailStates.p + (4.435594)*sailStates.q + (-0.009253)*sailStates.r + (-0.000279)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end