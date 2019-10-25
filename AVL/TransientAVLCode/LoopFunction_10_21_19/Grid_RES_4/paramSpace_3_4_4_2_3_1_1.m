function [aeroForces] = paramSpace_3_4_4_2_3_1_1(sailStates,airStates)

	CL = (4.511471)*sailStates.alpha + (0.169663)*sailStates.beta + (-2.126033)*sailStates.p + (30.218609)*sailStates.q + (-0.919906)*sailStates.r + (0.010404)*sailStates.de;
	CD = -0.508430;
	CY = (0.191175)*sailStates.alpha + (-0.025991)*sailStates.beta + (-0.520387)*sailStates.p + (0.870358)*sailStates.q + (0.034200)*sailStates.r + (0.000185)*sailStates.de;

	Cl = (1.190042)*sailStates.alpha + (0.286260)*sailStates.beta + (-0.817772)*sailStates.p + (5.727823)*sailStates.q + (-0.892641)*sailStates.r + (-0.000295)*sailStates.de;
	Cm = (-15.060085)*sailStates.alpha + (-0.589175)*sailStates.beta + (7.655271)*sailStates.p + (-125.466835)*sailStates.q + (3.076944)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (-0.731987)*sailStates.alpha + (-0.011181)*sailStates.beta + (1.201171)*sailStates.p + (-6.331828)*sailStates.q + (-0.017068)*sailStates.r + (-0.000354)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end