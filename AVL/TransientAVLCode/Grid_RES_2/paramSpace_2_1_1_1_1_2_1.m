function [aeroForces] = paramSpace_2_1_1_1_1_2_1(sailStates,airStates)

	CL = (5.707007)*sailStates.alpha + (-1.799511)*sailStates.beta + (-3.638403)*sailStates.p + (49.731850)*sailStates.q + (2.017549)*sailStates.r + (0.012681)*sailStates.de;
	CD = -5.144540;
	CY = (1.871271)*sailStates.alpha + (-0.118781)*sailStates.beta + (0.205284)*sailStates.p + (15.013589)*sailStates.q + (-0.021709)*sailStates.r + (0.003176)*sailStates.de;

	Cl = (-4.306062)*sailStates.alpha + (-0.951803)*sailStates.beta + (-1.837455)*sailStates.p + (15.797203)*sailStates.q + (2.215810)*sailStates.r + (0.001557)*sailStates.de;
	Cm = (0.971966)*sailStates.alpha + (7.964069)*sailStates.beta + (11.511168)*sailStates.p + (-163.474167)*sailStates.q + (-7.111569)*sailStates.r + (-0.068110)*sailStates.de;
	Cn = (-2.049865)*sailStates.alpha + (0.194743)*sailStates.beta + (-0.661788)*sailStates.p + (-9.383832)*sailStates.q + (-0.184542)*sailStates.r + (-0.004141)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end