function [aeroForces] = paramSpace_3_1_3_2_2_3_3(sailStates,airStates)

	CL = (4.455353)*sailStates.alpha + (0.322536)*sailStates.beta + (-2.975517)*sailStates.p + (39.177456)*sailStates.q + (1.397587)*sailStates.r + (0.011301)*sailStates.de;
	CD = -0.482510;
	CY = (0.083263)*sailStates.alpha + (-0.024904)*sailStates.beta + (0.575682)*sailStates.p + (-0.100924)*sailStates.q + (-0.037736)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.571182)*sailStates.alpha + (-0.187822)*sailStates.beta + (-1.584511)*sailStates.p + (13.684491)*sailStates.q + (1.229536)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-13.732512)*sailStates.alpha + (-1.267126)*sailStates.beta + (9.806697)*sailStates.p + (-147.195892)*sailStates.q + (-4.746184)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (-0.304522)*sailStates.alpha + (0.019557)*sailStates.beta + (-1.191515)*sailStates.p + (5.088128)*sailStates.q + (0.004276)*sailStates.r + (0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end