function [aeroForces] = paramSpace_9_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.257404)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.357126)*sailStates.p + (32.873726)*sailStates.q + (-0.492902)*sailStates.r + (0.010953)*sailStates.de;
	CD = -0.140990;
	CY = (0.081520)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.307117)*sailStates.p + (0.438542)*sailStates.q + (0.010679)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.233240)*sailStates.alpha + (0.135805)*sailStates.beta + (-1.037027)*sailStates.p + (8.068227)*sailStates.q + (-0.515508)*sailStates.r + (0.000068)*sailStates.de;
	Cm = (-15.073187)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.190373)*sailStates.p + (-131.751755)*sailStates.q + (1.700409)*sailStates.r + (-0.069836)*sailStates.de;
	Cn = (-0.295046)*sailStates.alpha + (-0.004742)*sailStates.beta + (0.688039)*sailStates.p + (-3.412385)*sailStates.q + (-0.004992)*sailStates.r + (-0.000166)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end