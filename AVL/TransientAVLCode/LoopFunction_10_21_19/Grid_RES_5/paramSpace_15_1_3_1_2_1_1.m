function [aeroForces] = paramSpace_15_1_3_1_2_1_1(sailStates,airStates)

	CL = (4.396942)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.863868)*sailStates.p + (25.444237)*sailStates.q + (-0.571508)*sailStates.r + (0.009030)*sailStates.de;
	CD = -0.711300;
	CY = (0.270846)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.533350)*sailStates.p + (1.423510)*sailStates.q + (0.133031)*sailStates.r + (0.000296)*sailStates.de;

	Cl = (1.189848)*sailStates.alpha + (0.210735)*sailStates.beta + (-0.724880)*sailStates.p + (4.534687)*sailStates.q + (-0.756874)*sailStates.r + (-0.000227)*sailStates.de;
	Cm = (-15.829248)*sailStates.alpha + (0.000000)*sailStates.beta + (7.758327)*sailStates.p + (-121.603668)*sailStates.q + (1.697660)*sailStates.r + (-0.065245)*sailStates.de;
	Cn = (-1.002496)*sailStates.alpha + (-0.052542)*sailStates.beta + (1.332439)*sailStates.p + (-7.467395)*sailStates.q + (-0.098527)*sailStates.r + (-0.000507)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end