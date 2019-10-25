function [aeroForces] = paramSpace_4_3_1_2_3_3_1(sailStates,airStates)

	CL = (4.274175)*sailStates.alpha + (-0.121378)*sailStates.beta + (-2.193201)*sailStates.p + (35.384743)*sailStates.q + (1.647477)*sailStates.r + (0.011295)*sailStates.de;
	CD = -0.354330;
	CY = (0.054988)*sailStates.alpha + (-0.025991)*sailStates.beta + (0.500778)*sailStates.p + (1.057316)*sailStates.q + (-0.099725)*sailStates.r + (0.000223)*sailStates.de;

	Cl = (0.954616)*sailStates.alpha + (-0.326291)*sailStates.beta + (-0.868070)*sailStates.p + (7.553854)*sailStates.q + (1.301395)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-12.213370)*sailStates.alpha + (0.431065)*sailStates.beta + (6.524102)*sailStates.p + (-125.069839)*sailStates.q + (-5.464493)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.306083)*sailStates.alpha + (0.058401)*sailStates.beta + (-1.055430)*sailStates.p + (3.685280)*sailStates.q + (-0.014653)*sailStates.r + (-0.000206)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end