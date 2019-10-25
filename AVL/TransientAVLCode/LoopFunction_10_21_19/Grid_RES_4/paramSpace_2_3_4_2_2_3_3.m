function [aeroForces] = paramSpace_2_3_4_2_2_3_3(sailStates,airStates)

	CL = (4.426276)*sailStates.alpha + (-0.063849)*sailStates.beta + (-2.942955)*sailStates.p + (36.994934)*sailStates.q + (0.636886)*sailStates.r + (0.011044)*sailStates.de;
	CD = -0.426030;
	CY = (0.080363)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.407536)*sailStates.p + (0.100923)*sailStates.q + (0.026722)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.458300)*sailStates.alpha + (-0.221441)*sailStates.beta + (-1.512144)*sailStates.p + (12.313552)*sailStates.q + (0.709924)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.940111)*sailStates.alpha + (0.285214)*sailStates.beta + (10.328869)*sailStates.p + (-148.239990)*sailStates.q + (-2.195292)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.054308)*sailStates.alpha + (-0.012984)*sailStates.beta + (-0.989320)*sailStates.p + (4.609544)*sailStates.q + (-0.012163)*sailStates.r + (0.000038)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end