function [aeroForces] = paramSpace_1_1_3_2_3_2_3(sailStates,airStates)

	CL = (3.950284)*sailStates.alpha + (-0.178399)*sailStates.beta + (-2.857626)*sailStates.p + (38.349777)*sailStates.q + (-1.196860)*sailStates.r + (0.010903)*sailStates.de;
	CD = 0.025130;
	CY = (0.074183)*sailStates.alpha + (-0.027165)*sailStates.beta + (-0.341452)*sailStates.p + (1.027328)*sailStates.q + (-0.060110)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.471377)*sailStates.alpha + (0.055767)*sailStates.beta + (-1.517552)*sailStates.p + (13.443795)*sailStates.q + (-0.849978)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-13.856254)*sailStates.alpha + (0.564128)*sailStates.beta + (9.313622)*sailStates.p + (-144.553253)*sailStates.q + (3.973753)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.202416)*sailStates.alpha + (0.022304)*sailStates.beta + (0.521697)*sailStates.p + (-2.289457)*sailStates.q + (-0.011082)*sailStates.r + (-0.000358)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end