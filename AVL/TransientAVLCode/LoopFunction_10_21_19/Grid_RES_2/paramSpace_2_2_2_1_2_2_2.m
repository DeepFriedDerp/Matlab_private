function [aeroForces] = paramSpace_2_2_2_1_2_2_2(sailStates,airStates)

	CL = (4.375302)*sailStates.alpha + (-0.295753)*sailStates.beta + (-3.114954)*sailStates.p + (42.129452)*sailStates.q + (1.840713)*sailStates.r + (0.011640)*sailStates.de;
	CD = -0.617880;
	CY = (0.234548)*sailStates.alpha + (-0.026022)*sailStates.beta + (0.651192)*sailStates.p + (0.715008)*sailStates.q + (-0.085680)*sailStates.r + (0.000154)*sailStates.de;

	Cl = (1.271577)*sailStates.alpha + (-0.435281)*sailStates.beta + (-1.599978)*sailStates.p + (14.053797)*sailStates.q + (1.577821)*sailStates.r + (0.000964)*sailStates.de;
	Cm = (-12.155692)*sailStates.alpha + (1.165268)*sailStates.beta + (9.817899)*sailStates.p + (-150.764206)*sailStates.q + (-6.220822)*sailStates.r + (-0.070345)*sailStates.de;
	Cn = (-0.589224)*sailStates.alpha + (0.046988)*sailStates.beta + (-1.294943)*sailStates.p + (4.538779)*sailStates.q + (-0.009745)*sailStates.r + (-0.000092)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end