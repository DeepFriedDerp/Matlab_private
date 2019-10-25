function [aeroForces] = paramSpace_3_1_1_1_1_2_3(sailStates,airStates)

	CL = (3.890862)*sailStates.alpha + (0.113471)*sailStates.beta + (-3.415271)*sailStates.p + (41.939144)*sailStates.q + (0.874356)*sailStates.r + (0.011373)*sailStates.de;
	CD = -0.041180;
	CY = (-0.108988)*sailStates.alpha + (-0.026223)*sailStates.beta + (0.362102)*sailStates.p + (-1.915493)*sailStates.q + (-0.023531)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (1.599072)*sailStates.alpha + (-0.043819)*sailStates.beta + (-1.960021)*sailStates.p + (17.051277)*sailStates.q + (0.649425)*sailStates.r + (0.001608)*sailStates.de;
	Cm = (-13.761678)*sailStates.alpha + (-0.306137)*sailStates.beta + (11.454757)*sailStates.p + (-159.650192)*sailStates.q + (-2.899274)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-0.218687)*sailStates.alpha + (0.007826)*sailStates.beta + (-0.652902)*sailStates.p + (4.035682)*sailStates.q + (0.008059)*sailStates.r + (0.000639)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end