function [aeroForces] = paramSpace_14_1_3_1_1_2_2(sailStates,airStates)

	CL = (5.225512)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.031770)*sailStates.p + (44.631931)*sailStates.q + (2.811790)*sailStates.r + (0.011761)*sailStates.de;
	CD = -1.049090;
	CY = (0.031964)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.052939)*sailStates.p + (-1.364608)*sailStates.q + (-0.223858)*sailStates.r + (-0.000291)*sailStates.de;

	Cl = (2.051689)*sailStates.alpha + (-0.472409)*sailStates.beta + (-1.572889)*sailStates.p + (15.164908)*sailStates.q + (2.312114)*sailStates.r + (0.000915)*sailStates.de;
	Cm = (-12.053945)*sailStates.alpha + (0.000000)*sailStates.beta + (8.399308)*sailStates.p + (-146.890121)*sailStates.q + (-9.293948)*sailStates.r + (-0.068730)*sailStates.de;
	Cn = (-0.670761)*sailStates.alpha + (0.100414)*sailStates.beta + (-2.065319)*sailStates.p + (9.075070)*sailStates.q + (0.018632)*sailStates.r + (0.000569)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end