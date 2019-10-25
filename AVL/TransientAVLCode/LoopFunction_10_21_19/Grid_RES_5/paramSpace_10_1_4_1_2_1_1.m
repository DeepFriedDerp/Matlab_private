function [aeroForces] = paramSpace_10_1_4_1_2_1_1(sailStates,airStates)

	CL = (4.934985)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.032124)*sailStates.p + (29.205391)*sailStates.q + (-1.240357)*sailStates.r + (0.010445)*sailStates.de;
	CD = -0.861260;
	CY = (0.277509)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.682305)*sailStates.p + (1.113124)*sailStates.q + (0.047829)*sailStates.r + (0.000238)*sailStates.de;

	Cl = (1.391490)*sailStates.alpha + (0.296179)*sailStates.beta + (-0.786840)*sailStates.p + (5.480512)*sailStates.q + (-1.186347)*sailStates.r + (-0.000299)*sailStates.de;
	Cm = (-15.587364)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.471639)*sailStates.p + (-123.764404)*sailStates.q + (4.157385)*sailStates.r + (-0.068848)*sailStates.de;
	Cn = (-1.033374)*sailStates.alpha + (-0.020711)*sailStates.beta + (1.558406)*sailStates.p + (-8.140083)*sailStates.q + (-0.022555)*sailStates.r + (-0.000451)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end