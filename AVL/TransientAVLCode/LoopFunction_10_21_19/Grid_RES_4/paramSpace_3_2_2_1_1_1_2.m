function [aeroForces] = paramSpace_3_2_2_1_1_1_2(sailStates,airStates)

	CL = (5.465117)*sailStates.alpha + (-0.132935)*sailStates.beta + (-2.491755)*sailStates.p + (32.395027)*sailStates.q + (-1.450501)*sailStates.r + (0.010517)*sailStates.de;
	CD = -1.721750;
	CY = (-0.202587)*sailStates.alpha + (-0.025520)*sailStates.beta + (-0.708060)*sailStates.p + (-1.693497)*sailStates.q + (0.046468)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.191331)*sailStates.alpha + (0.390427)*sailStates.beta + (-1.195474)*sailStates.p + (9.315658)*sailStates.q + (-1.499889)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-14.633127)*sailStates.alpha + (0.547829)*sailStates.beta + (9.057528)*sailStates.p + (-136.398376)*sailStates.q + (4.949947)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.176440)*sailStates.alpha + (-0.028182)*sailStates.beta + (1.705736)*sailStates.p + (-6.695930)*sailStates.q + (-0.008508)*sailStates.r + (0.000345)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end