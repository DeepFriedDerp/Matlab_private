function [aeroForces] = paramSpace_3_4_4_1_1_2_3(sailStates,airStates)

	CL = (3.858131)*sailStates.alpha + (-0.179076)*sailStates.beta + (-3.414296)*sailStates.p + (41.989250)*sailStates.q + (0.904453)*sailStates.r + (0.011280)*sailStates.de;
	CD = -0.031450;
	CY = (-0.092452)*sailStates.alpha + (-0.022135)*sailStates.beta + (0.407339)*sailStates.p + (-1.915493)*sailStates.q + (-0.026901)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (1.509211)*sailStates.alpha + (-0.188238)*sailStates.beta + (-1.861878)*sailStates.p + (15.844944)*sailStates.q + (0.716690)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-13.591086)*sailStates.alpha + (0.721945)*sailStates.beta + (11.443217)*sailStates.p + (-159.650192)*sailStates.q + (-3.075316)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-0.236499)*sailStates.alpha + (0.005524)*sailStates.beta + (-0.726133)*sailStates.p + (4.148776)*sailStates.q + (0.008632)*sailStates.r + (0.000592)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end