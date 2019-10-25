function [aeroForces] = paramSpace_1_1_3_3_1_1_2(sailStates,airStates)

	CL = (4.084582)*sailStates.alpha + (-0.257850)*sailStates.beta + (-2.544251)*sailStates.p + (36.947632)*sailStates.q + (-1.395890)*sailStates.r + (0.011122)*sailStates.de;
	CD = -0.131720;
	CY = (-0.064113)*sailStates.alpha + (-0.023714)*sailStates.beta + (-0.403482)*sailStates.p + (-0.491627)*sailStates.q + (-0.071191)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.256333)*sailStates.alpha + (0.138287)*sailStates.beta + (-1.231669)*sailStates.p + (10.873613)*sailStates.q + (-1.085433)*sailStates.r + (0.000474)*sailStates.de;
	Cm = (-13.118560)*sailStates.alpha + (0.899746)*sailStates.beta + (8.036660)*sailStates.p + (-135.234573)*sailStates.q + (4.650177)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.120608)*sailStates.alpha + (0.037175)*sailStates.beta + (0.761253)*sailStates.p + (-2.485787)*sailStates.q + (-0.019002)*sailStates.r + (0.000058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end