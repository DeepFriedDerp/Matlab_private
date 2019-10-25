function [aeroForces] = paramSpace_1_3_3_2_3_2_1(sailStates,airStates)

	CL = (3.935220)*sailStates.alpha + (0.067181)*sailStates.beta + (-2.070696)*sailStates.p + (32.079891)*sailStates.q + (-1.020177)*sailStates.r + (0.010492)*sailStates.de;
	CD = 0.025750;
	CY = (0.108262)*sailStates.alpha + (-0.024508)*sailStates.beta + (-0.286850)*sailStates.p + (0.455225)*sailStates.q + (-0.057042)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.029244)*sailStates.alpha + (0.145595)*sailStates.beta + (-0.815551)*sailStates.p + (6.683820)*sailStates.q + (-0.693950)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-13.603382)*sailStates.alpha + (-0.231197)*sailStates.beta + (6.665797)*sailStates.p + (-122.911674)*sailStates.q + (3.398697)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (-0.221465)*sailStates.alpha + (0.024619)*sailStates.beta + (0.517761)*sailStates.p + (-2.356584)*sailStates.q + (-0.002837)*sailStates.r + (-0.000166)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end