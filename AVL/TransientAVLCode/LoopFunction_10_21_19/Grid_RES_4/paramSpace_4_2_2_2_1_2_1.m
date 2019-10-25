function [aeroForces] = paramSpace_4_2_2_2_1_2_1(sailStates,airStates)

	CL = (3.935220)*sailStates.alpha + (0.067181)*sailStates.beta + (-2.070696)*sailStates.p + (32.079891)*sailStates.q + (1.020177)*sailStates.r + (0.010492)*sailStates.de;
	CD = 0.025750;
	CY = (-0.108262)*sailStates.alpha + (-0.025445)*sailStates.beta + (0.286850)*sailStates.p + (-0.455225)*sailStates.q + (-0.057042)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.081511)*sailStates.alpha + (-0.104435)*sailStates.beta + (-0.847094)*sailStates.p + (7.080784)*sailStates.q + (0.700211)*sailStates.r + (-0.000184)*sailStates.de;
	Cm = (-13.603382)*sailStates.alpha + (-0.231197)*sailStates.beta + (6.665797)*sailStates.p + (-122.911674)*sailStates.q + (-3.398697)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.199701)*sailStates.alpha + (0.025115)*sailStates.beta + (-0.511487)*sailStates.p + (2.277622)*sailStates.q + (-0.004082)*sailStates.r + (0.000166)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end