function [aeroForces] = paramSpace_4_4_3_2_1_1_2(sailStates,airStates)

	CL = (3.984270)*sailStates.alpha + (-0.003858)*sailStates.beta + (-2.361423)*sailStates.p + (31.559923)*sailStates.q + (0.153859)*sailStates.r + (0.009719)*sailStates.de;
	CD = -0.212410;
	CY = (-0.089786)*sailStates.alpha + (-0.022301)*sailStates.beta + (-0.121348)*sailStates.p + (-0.756270)*sailStates.q + (0.024111)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.090000)*sailStates.alpha + (0.082353)*sailStates.beta + (-1.068561)*sailStates.p + (8.326899)*sailStates.q + (-0.115137)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-14.528382)*sailStates.alpha + (-0.017612)*sailStates.beta + (8.514306)*sailStates.p + (-132.741791)*sailStates.q + (-0.576096)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (-0.175885)*sailStates.alpha + (-0.014008)*sailStates.beta + (0.486575)*sailStates.p + (-2.261319)*sailStates.q + (-0.031576)*sailStates.r + (0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end