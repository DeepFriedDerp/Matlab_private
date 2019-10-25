function [aeroForces] = paramSpace_1_1_3_3_3_1_2(sailStates,airStates)

	CL = (4.345623)*sailStates.alpha + (-0.289124)*sailStates.beta + (-2.518306)*sailStates.p + (37.091827)*sailStates.q + (-1.648882)*sailStates.r + (0.011117)*sailStates.de;
	CD = -0.252130;
	CY = (0.065597)*sailStates.alpha + (-0.025948)*sailStates.beta + (-0.560400)*sailStates.p + (0.491624)*sailStates.q + (-0.098767)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.470678)*sailStates.alpha + (0.162572)*sailStates.beta + (-1.215528)*sailStates.p + (10.919208)*sailStates.q + (-1.292824)*sailStates.r + (0.000416)*sailStates.de;
	Cm = (-13.346184)*sailStates.alpha + (1.003776)*sailStates.beta + (7.736864)*sailStates.p + (-133.990967)*sailStates.q + (5.474167)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (-0.041179)*sailStates.alpha + (0.047101)*sailStates.beta + (1.090184)*sailStates.p + (-4.715941)*sailStates.q + (0.001787)*sailStates.r + (-0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end