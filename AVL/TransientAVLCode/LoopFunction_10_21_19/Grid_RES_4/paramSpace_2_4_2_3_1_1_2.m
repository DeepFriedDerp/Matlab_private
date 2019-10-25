function [aeroForces] = paramSpace_2_4_2_3_1_1_2(sailStates,airStates)

	CL = (4.141072)*sailStates.alpha + (0.213984)*sailStates.beta + (-2.569043)*sailStates.p + (35.464474)*sailStates.q + (-0.857737)*sailStates.r + (0.011015)*sailStates.de;
	CD = -0.141260;
	CY = (-0.062659)*sailStates.alpha + (-0.025370)*sailStates.beta + (-0.310261)*sailStates.p + (-0.498142)*sailStates.q + (-0.020318)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.155150)*sailStates.alpha + (0.228868)*sailStates.beta + (-1.158444)*sailStates.p + (9.305681)*sailStates.q + (-0.739841)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-14.040252)*sailStates.alpha + (-0.854251)*sailStates.beta + (8.600556)*sailStates.p + (-136.384674)*sailStates.q + (2.924280)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (-0.016920)*sailStates.alpha + (0.011469)*sailStates.beta + (0.642138)*sailStates.p + (-2.302788)*sailStates.q + (-0.001492)*sailStates.r + (0.000093)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end