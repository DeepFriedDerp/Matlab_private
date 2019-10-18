function [aeroForces] = paramSpace_2_1_1_2_1_2_2(sailStates,airStates)

	CL = (5.643254)*sailStates.alpha + (-1.766893)*sailStates.beta + (-3.622923)*sailStates.p + (49.467815)*sailStates.q + (1.954365)*sailStates.r + (0.012637)*sailStates.de;
	CD = -4.955850;
	CY = (1.849264)*sailStates.alpha + (-0.118320)*sailStates.beta + (0.179309)*sailStates.p + (14.940358)*sailStates.q + (-0.018316)*sailStates.r + (0.003160)*sailStates.de;

	Cl = (-4.142577)*sailStates.alpha + (-0.927979)*sailStates.beta + (-1.827169)*sailStates.p + (15.673972)*sailStates.q + (2.154939)*sailStates.r + (0.001541)*sailStates.de;
	Cm = (0.487166)*sailStates.alpha + (7.835361)*sailStates.beta + (11.496698)*sailStates.p + (-163.129807)*sailStates.q + (-6.898613)*sailStates.r + (-0.068069)*sailStates.de;
	Cn = (-2.005858)*sailStates.alpha + (0.192557)*sailStates.beta + (-0.602109)*sailStates.p + (-9.593472)*sailStates.q + (-0.184511)*sailStates.r + (-0.004126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end