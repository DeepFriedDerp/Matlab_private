function [aeroForces] = paramSpace_1_3_1_2_1_1_1(sailStates,airStates)

	CL = (4.188528)*sailStates.alpha + (0.142280)*sailStates.beta + (-2.191301)*sailStates.p + (35.529671)*sailStates.q + (-1.671644)*sailStates.r + (0.011034)*sailStates.de;
	CD = -0.354950;
	CY = (-0.047503)*sailStates.alpha + (-0.026211)*sailStates.beta + (-0.543932)*sailStates.p + (-1.057315)*sailStates.q + (-0.108081)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (0.944888)*sailStates.alpha + (0.347945)*sailStates.beta + (-0.867141)*sailStates.p + (7.560579)*sailStates.q + (-1.370833)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-11.596039)*sailStates.alpha + (-0.563093)*sailStates.beta + (6.496996)*sailStates.p + (-125.069839)*sailStates.q + (5.600762)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (-0.326462)*sailStates.alpha + (0.062893)*sailStates.beta + (1.120462)*sailStates.p + (-3.719087)*sailStates.q + (-0.015974)*sailStates.r + (0.000228)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end