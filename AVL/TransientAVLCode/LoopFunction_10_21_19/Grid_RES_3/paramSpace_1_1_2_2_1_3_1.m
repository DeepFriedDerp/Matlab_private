function [aeroForces] = paramSpace_1_1_2_2_1_3_1(sailStates,airStates)

	CL = (4.299860)*sailStates.alpha + (0.089486)*sailStates.beta + (-2.045943)*sailStates.p + (28.393990)*sailStates.q + (0.479347)*sailStates.r + (0.009794)*sailStates.de;
	CD = -0.457810;
	CY = (-0.191942)*sailStates.alpha + (-0.022243)*sailStates.beta + (0.437553)*sailStates.p + (-1.027328)*sailStates.q + (0.077152)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.255633)*sailStates.alpha + (-0.146079)*sailStates.beta + (-0.879206)*sailStates.p + (6.410355)*sailStates.q + (0.613563)*sailStates.r + (-0.000021)*sailStates.de;
	Cm = (-15.339276)*sailStates.alpha + (-0.362276)*sailStates.beta + (7.814238)*sailStates.p + (-124.672379)*sailStates.q + (-1.530223)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.704145)*sailStates.alpha + (-0.039422)*sailStates.beta + (-1.089261)*sailStates.p + (6.082451)*sailStates.q + (-0.056543)*sailStates.r + (0.000375)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end